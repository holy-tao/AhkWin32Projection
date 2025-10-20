#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the media sharing engine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfsharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSharingEngineClassFactory extends IUnknown{
    /**
     * The interface identifier for IMFSharingEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{2ba61f92-8305-413b-9733-faf15f259384}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMFAttributes>} pAttr 
     * @param {Pointer<IUnknown>} ppEngine 
     * @returns {HRESULT} 
     */
    CreateInstance(dwFlags, pAttr, ppEngine) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr", ppEngine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
