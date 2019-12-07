// docker run \
//     --name testneo4j \
//     -p7474:7474 -p7687:7687 \
//     -d \
//     -v $HOME/neo4j/data:/data \
//     -v $HOME/neo4j/logs:/logs \
//     -v $HOME/neo4j/import:/var/lib/neo4j/import \
//     -v $HOME/neo4j/plugins:/plugins \
//     --env NEO4J_AUTH=none \
//     neo4j:latest


MATCH (s)-[r]->(m) DELETE s, r, m

CREATE
    (e1:Element { value: 1 }),
    (e2:Element { value: 2 }),
    (e3:Element { value: 3 }),
    (e4:Element { value: 4 })

MATCH (n) RETURN n

MATCH (n:Element)
CREATE (n)-[r:Id]->(n)

MATCH (n) RETURN n

MATCH (n:Element), (m:Element)
WHERE n.value + 1 = m.value
CREATE (n)-[r:Next]->(m)

MATCH (n) RETURN n

MATCH (n:Element), (m:Element)
WHERE n.value + 2 = m.value
CREATE (n)-[r:NextNext]->(m)

MATCH (n) RETURN n

MATCH (n:Element), (m:Element)
WHERE n.value + 3 = m.value
CREATE (n)-[r:NextNextNext]->(m)

MATCH (n) RETURN n

MATCH (s)-[r]->(m) DELETE s, r, m
MATCH (n) DELETE n

CREATE
    (e1:Latin { value: 'a' }),
    (e2:Latin { value: 'b' }),
    (e3:Latin { value: 'c' }),
    (e4:Greek { value: 'alpha' }),
    (e5:Greek { value: 'beta' }),
    (e6:Greek { value: 'gamma' })

MATCH (e1)
CREATE (e1)-[r:Id]->(e1)

MATCH (e1:Latin), (e2:Latin)
WHERE e1.value = 'a' AND e2.value = 'b'
CREATE (e1)-[r:Succesor]->(e2)

MATCH (e1:Latin), (e2:Latin)
WHERE e1.value = 'b' AND e2.value = 'c'
CREATE (e1)-[r:Succesor]->(e2)

MATCH (e1:Latin), (e2:Latin)
WHERE e1.value = 'a' AND e2.value = 'c'
CREATE (e1)-[r:SecondSuccesor]->(e2)

MATCH (e1:Greek), (e2:Greek)
WHERE e1.value = 'alpha' AND e2.value = 'beta'
CREATE (e1)-[r:Follower]->(e2)

MATCH (e1:Greek), (e2:Greek)
WHERE e1.value = 'beta' AND e2.value = 'gamma'
CREATE (e1)-[r:Follower]->(e2)

MATCH (e1:Greek), (e2:Greek)
WHERE e1.value = 'alpha' AND e2.value = 'gamma'
CREATE (e1)-[r:SecondFollower]->(e2)

MATCH (e1:Latin), (e2:Greek)
WHERE e1.value = 'a' AND e2.value = 'alpha'
CREATE (e1)-[r:LatinToGreek]->(e2)

MATCH (e1:Latin), (e2:Greek)
WHERE e1.value = 'b' AND e2.value = 'beta'
CREATE (e1)-[r:LatinToGreek]->(e2)

MATCH (e1:Latin), (e2:Greek)
WHERE e1.value = 'c' AND e2.value = 'gamma'
CREATE (e1)-[r:LatinToGreek]->(e2)

MATCH (n) RETURN n

MATCH (s)-[r]->(m) DELETE s, r, m
MATCH (n) DELETE n

CREATE
    (a1:A { value: 'x' }),
    (b1:B { value: 1 }),
    (b2:B { value: 2 }),
    (b3:B { value: 3 }),
    (b4:B { value: 4 })

MATCH (e1)
CREATE (e1)-[r:Id]->(e1)

MATCH (a1:A), (b1:B)
WHERE a1.value = 'x' AND b1.value = 2
CREATE (a1)-[r:Pick]->(b1)

MATCH (n) RETURN n

MATCH (s)-[r]->(m) DELETE r
MATCH (n) DELETE n

CREATE
    (a1:A { value: 'x' }),
    (b1:B { value: 1 }),
    (b2:B { value: 2 }),
    (b3:B { value: 3 }),
    (b4:B { value: 4 })

MATCH (e1)
CREATE (e1)-[r:Id]->(e1)

MATCH (a1:A), (b1:B)
CREATE (b1)-[r:Const]->(a1)

MATCH (n) RETURN n