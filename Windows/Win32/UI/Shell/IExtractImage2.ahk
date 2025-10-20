#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IExtractImage.ahk

/**
 * Extends the capabilities of IExtractImage.
 * @remarks
 * 
  * Implement <b>IExtractImage2</b> to provide date stamps for your thumbnail images.
  * 
  * You do not call this interface directly. <b>IExtractImage2</b> is used by the operating system only when it has confirmed that your application is aware of this interface.
  * 
  * <b>IExtractImage2</b> implements all the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iextractimage">IExtractImage</a> methods as well as 
  * 				<b>IUnknown</b>. The listed method is specific to <b>IExtractImage2</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iextractimage2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IExtractImage2 extends IExtractImage{
    /**
     * The interface identifier for IExtractImage2
     * @type {Guid}
     */
    static IID => Guid("{953bb1ee-93b4-11d1-98a3-00c04fb687da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Pointer<FILETIME>} pDateStamp 
     * @returns {HRESULT} 
     */
    GetDateStamp(pDateStamp) {
        result := ComCall(5, this, "ptr", pDateStamp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
