#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISeekingPassThru interface creates a helper object that implements seeking for one-input filters.
 * @remarks
 * 
  * To obtain this interface, call <b>CoCreateInstance</b> with CLSID_SeekingPassThru. You can also use the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/createpospassthru">CreatePosPassThru</a> function in the base class library.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iseekingpassthru
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ISeekingPassThru extends IUnknown{
    /**
     * The interface identifier for ISeekingPassThru
     * @type {Guid}
     */
    static IID => Guid("{36b73883-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} bSupportRendering 
     * @param {Pointer<IPin>} pPin 
     * @returns {HRESULT} 
     */
    Init(bSupportRendering, pPin) {
        result := ComCall(3, this, "int", bSupportRendering, "ptr", pPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
