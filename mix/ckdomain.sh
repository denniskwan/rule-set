awk -F'[./]' '{
    # 提取二级域名，假设域名的格式是 "sub.domain.tld"
    # $2 是 "domain"，$3 是 "tld"（顶级域名），我们拼接它们作为键
    domain_key = $2 "." $3;
    
    # 计数每个二级域名的出现次数
    count[domain_key]++;
}
END {
    # 遍历关联数组，打印出出现次数大于1的二级域名及其出现次数
    for (domain in count) {
        if (count[domain] > 1) {
            print domain " occurred " count[domain] " times";
        }
    }
}' domains.txt

