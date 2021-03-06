part of bitcoin.core;

class _TestNetParams extends NetworkParameters {
  static Block _genesis;

  const _TestNetParams()
      : super._(
            addressHeader: 111,
            p2shHeader: 196,
            magicValue: 0x0709110B,
            id: "org.bitcoin.test",
            port: 18333);

  Block get genesisBlock {
    if (_genesis == null) {
      Block genesis = NetworkParameters._createGenesis(this)
        ..timestamp = 1296688602
        ..nonce = 414098458
        ..difficultyTarget = 0x1d00ffff;
      _genesis = genesis;
    }
    return _genesis;
  }

  BigInteger get proofOfWorkLimit => utils.decodeCompactBits(0x1d00ffff);
}
