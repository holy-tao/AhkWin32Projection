#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the SoH protocol between the SHA/SHV and the NAP system.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ns-naptypes-sohattribute
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct SoHAttribute {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributetype-enum">SoHAttributeType</a> value that defines the attribute type contained in <b>value</b>.
     */
    type : UInt16

    /**
     * The size, in bytes, of the SoH attribute pointed to by <b>value</b> and has a range of 0 to <a href="https://docs.microsoft.com/windows/desktop/NAP/nap-type-constants">maxSoHAttributeSize</a>.
     */
    size : UInt16

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/NAP/sohattributevalue-union">SoHAttributeValue</a> structure that contains the SoH attribute value as defined by <b>type</b>.
     */
    value : IntPtr

}
