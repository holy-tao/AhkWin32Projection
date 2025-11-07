#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSharingEngine.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFMediaSharingEngine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfmediasharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSharingEngineClassFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaSharingEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{524d2bc4-b2b1-4fe5-8fac-fa4e4512b4e0}")

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
     * @returns {IMFMediaSharingEngine} 
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfmediasharingengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppEngine := 0, "HRESULT")
        return IMFMediaSharingEngine(ppEngine)
    }
}
