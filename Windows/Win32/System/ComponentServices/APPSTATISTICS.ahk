#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct APPSTATISTICS {
    #StructPack 4

    m_cTotalCalls : UInt32

    m_cTotalInstances : UInt32

    m_cTotalClasses : UInt32

    m_cCallsPerSecond : UInt32

}
