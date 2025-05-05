"""
Örnek testler.
"""
from django.test import SimpleTestCase
from app import calc


class CalcTests(SimpleTestCase):
    """calc modülünü test edeceğiz."""

    def test_add_numbers(self):
        """İki sayıyı toplar mı onu test ederiz."""
        res = calc.add(5, 6)
        self.assertEqual(res, 11)  # Beklenen sonuç 11 mi? Evetse test geçer.

    def test_sub_numbers(self):
        """İki sayıyı çıkarabiliyor mu onu test ederiz."""
        res = calc.subtract(10, 15)
        self.assertEqual(res, 5)  # 15 - 10 = 5
