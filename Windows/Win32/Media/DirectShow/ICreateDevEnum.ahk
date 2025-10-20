#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ICreateDevEnum interface creates an enumerator for a category of filters, such as video capture devices or audio capture devices.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-icreatedevenum
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ICreateDevEnum extends IUnknown{
    /**
     * The interface identifier for ICreateDevEnum
     * @type {Guid}
     */
    static IID => Guid("{29840822-5b84-11d0-bd3b-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} clsidDeviceClass 
     * @param {Pointer<IEnumMoniker>} ppEnumMoniker 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    CreateClassEnumerator(clsidDeviceClass, ppEnumMoniker, dwFlags) {
        result := ComCall(3, this, "ptr", clsidDeviceClass, "ptr", ppEnumMoniker, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
