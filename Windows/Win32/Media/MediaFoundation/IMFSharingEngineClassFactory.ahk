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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IMFAttributes} pAttr 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfsharingengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppEngine := 0, "HRESULT")
        return IUnknown(ppEngine)
    }
}
