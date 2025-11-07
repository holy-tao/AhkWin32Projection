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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSampleProperties", "SetSampleProperties"]

    /**
     * 
     * @param {Integer} cbProperties 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer2
     */
    GetSampleProperties(cbProperties) {
        result := ComCall(8, this, "uint", cbProperties, "char*", &pbProperties := 0, "HRESULT")
        return pbProperties
    }

    /**
     * 
     * @param {Integer} cbProperties 
     * @param {Pointer<Integer>} pbProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nn-wmsbuffer-inssbuffer2
     */
    SetSampleProperties(cbProperties, pbProperties) {
        pbPropertiesMarshal := pbProperties is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", cbProperties, pbPropertiesMarshal, pbProperties, "HRESULT")
        return result
    }
}
