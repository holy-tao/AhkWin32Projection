#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IReleaseMarshalBuffers extends IUnknown{
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
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} pChnl 
     * @returns {HRESULT} 
     */
    ReleaseMarshalBuffer(pMsg, dwFlags, pChnl) {
        result := ComCall(3, this, "ptr", pMsg, "uint", dwFlags, "ptr", pChnl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
