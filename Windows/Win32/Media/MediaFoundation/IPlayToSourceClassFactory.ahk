#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the PlayToSource object.
 * @remarks
 * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>. The CLSID is <b>CLSID_PlayToSourceClassFactory</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-iplaytosourceclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IPlayToSourceClassFactory extends IUnknown{
    /**
     * The interface identifier for IPlayToSourceClassFactory
     * @type {Guid}
     */
    static IID => Guid("{842b32a3-9b9b-4d1c-b3f3-49193248a554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPlayToControl>} pControl 
     * @param {Pointer<IInspectable>} ppSource 
     * @returns {HRESULT} 
     */
    CreateInstance(dwFlags, pControl, ppSource) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pControl, "ptr", ppSource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
