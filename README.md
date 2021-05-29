# AccessTest

### Mission A

#### Description

Build a Rate Limit Server to serve the incoming requests

Assume that we have a rate limit server and it can serve 60 requests per minute for each IP. An error will be returned if requests over the threshold. Please implement the rate limit server that fulfills the features above.

#### Solution

Open [`lib/access_test/rate_limit.ex`](https://github.com/dannypsnl/access_test/blob/develop/lib/access_test/rate_limit.ex) and [`lib/access_test/rate_limit/limitation_counter.ex`](https://github.com/dannypsnl/access_test/blob/develop/lib/access_test/rate_limit/limitation_counter.ex), records: 30 minutes

### Mission B

#### Description

Build a Voting Server to determine an issue about Wuhan coronavirus

Assume that we have a voting server that is designed for determining whether Wuhan coronavirus is created in China. The user can vote to agree or disagree at any time. Please implement two APIs one is to vote and one is for retrieving the current votes count.

#### Solution

Open [`lib/access_test/corona_vote.ex`](https://github.com/dannypsnl/access_test/blob/develop/lib/access_test/corona_vote.ex), record: 20 minutes
