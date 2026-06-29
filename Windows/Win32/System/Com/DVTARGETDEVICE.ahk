#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies information about the target device for which data is being composed. DVTARGETDEVICE contains enough information about a Windows target device so a handle to a device context (HDC) can be created using the CreateDC function.
 * @remarks
 * Some OLE 1 client applications incorrectly construct target devices by allocating too few bytes in the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure for the <b>DVTARGETDEVICE</b>. They typically only supply the number of bytes in the <b>dmSize</b> member of <b>DEVMODE</b>. The number of bytes to be allocated should be the sum of <b>dmSize</b> + <b>dmDriverExtra</b>. When a call is made to the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> function with an incorrect target device, the printer driver tries to access the additional bytes and unpredictable results can occur. To help protect against a crash and make the additional bytes available, OLE pads the size of OLE 2 target devices created from OLE 1 target devices.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-dvtargetdevice
 * @namespace Windows.Win32.System.Com
 */
export default struct DVTARGETDEVICE {
    #StructPack 4

    /**
     * The size, in bytes, of the <b>DVTARGETDEVICE</b> structure. The initial size is included so the structure can be copied more easily.
     */
    tdSize : UInt32

    /**
     * The offset, in bytes, from the beginning of the structure to the device driver name, which is stored as a NULL-terminated string in the <b>tdData</b> buffer.
     */
    tdDriverNameOffset : UInt16

    /**
     * The offset, in bytes, from the beginning of the structure to the device name, which is stored as a NULL-terminated string in the <b>tdData</b> buffer. This value can be zero to indicate no device name.
     */
    tdDeviceNameOffset : UInt16

    /**
     * The offset, in bytes, from the beginning of the structure to the port name, which is stored as a NULL-terminated string in the <b>tdData</b> buffer. This value can be zero to indicate no port name.
     */
    tdPortNameOffset : UInt16

    /**
     * The offset, in bytes, from the beginning of the structure to the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-devmodea">DEVMODE</a> structure retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/printdocs/documentproperties">DocumentProperties</a>.
     */
    tdExtDevmodeOffset : UInt16

    /**
     * An array of bytes containing data for the target device. It is not necessary to include empty strings in <b>tdData</b> (for names where the offset value is zero).
     */
    tdData : Int8[1]

}
