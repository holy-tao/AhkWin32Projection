#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer3.ahk

/**
 * The INSSBuffer4 interface provides methods to enumerate buffer properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer4
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer4 extends INSSBuffer3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer4
     * @type {Guid}
     */
    static IID => Guid("{b6b8fd5a-32e2-49d4-a910-c26cc85465ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyCount", "GetPropertyByIndex"]

    /**
     * 
     * @param {Pointer<Integer>} pcBufferProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertycount
     */
    GetPropertyCount(pcBufferProperties) {
        result := ComCall(12, this, "uint*", pcBufferProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBufferPropertyIndex 
     * @param {Pointer<Guid>} pguidBufferProperty 
     * @param {Pointer<Void>} pvBufferProperty 
     * @param {Pointer<Integer>} pdwBufferPropertySize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertybyindex
     */
    GetPropertyByIndex(dwBufferPropertyIndex, pguidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        result := ComCall(13, this, "uint", dwBufferPropertyIndex, "ptr", pguidBufferProperty, "ptr", pvBufferProperty, "uint*", pdwBufferPropertySize, "HRESULT")
        return result
    }
}
