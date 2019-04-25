import json
import unittest

from apps.status import handler


class StatusTest(unittest.TestCase):
    def test_handler_ok(self):
        res = handler.endpoint({}, {})
        self.assertEqual(res['statusCode'], 200)
        self.assertEqual(json.loads(res['body']), {'message':  'Hello world!'})
