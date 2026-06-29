#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct SWbemRpnTokenList {
    #StructPack 4

    m_uVersion : UInt32

    m_uTokenType : UInt32

    m_uNumTokens : UInt32

}
