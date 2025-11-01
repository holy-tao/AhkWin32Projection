#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IReleaseMarshalBuffers extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReleaseMarshalBuffers
     * @type {Guid}
     */
    static IID => Guid("{eb0cb9e8-7996-11d2-872e-0000f8080859}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReleaseMarshalBuffer"]

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pChnl 
     * @returns {HRESULT} 
     */
    ReleaseMarshalBuffer(pMsg, dwFlags, pChnl) {
        result := ComCall(3, this, "ptr", pMsg, "uint", dwFlags, "ptr", pChnl, "HRESULT")
        return result
    }
}
