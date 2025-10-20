#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk

/**
 * The INSSBuffer2 interface inherits from INSSBuffer and defines two additional methods. Currently, neither of these methods is implemented.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer2 extends INSSBuffer{
    /**
     * The interface identifier for INSSBuffer2
     * @type {Guid}
     */
    static IID => Guid("{4f528693-1035-43fe-b428-757561ad3a68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Integer} cbProperties 
     * @param {Pointer<Byte>} pbProperties 
     * @returns {HRESULT} 
     */
    GetSampleProperties(cbProperties, pbProperties) {
        result := ComCall(8, this, "uint", cbProperties, "char*", pbProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbProperties 
     * @param {Pointer<Byte>} pbProperties 
     * @returns {HRESULT} 
     */
    SetSampleProperties(cbProperties, pbProperties) {
        result := ComCall(9, this, "uint", cbProperties, "char*", pbProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
