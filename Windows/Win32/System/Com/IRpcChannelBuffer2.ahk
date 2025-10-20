#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRpcChannelBuffer.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IRpcChannelBuffer2 extends IRpcChannelBuffer{
    /**
     * The interface identifier for IRpcChannelBuffer2
     * @type {Guid}
     */
    static IID => Guid("{594f31d0-7f19-11d0-b194-00a0c90dc8bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} 
     */
    GetProtocolVersion(pdwVersion) {
        result := ComCall(8, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
