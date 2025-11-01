#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetContainer
     * @type {Guid}
     */
    static IID => Guid("{7847ec01-2bec-11d0-82b4-00a0c90c29c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrameUrl", "GetFramesContainer"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszFrameSrc 
     * @returns {HRESULT} 
     */
    GetFrameUrl(ppszFrameSrc) {
        result := ComCall(3, this, "ptr", ppszFrameSrc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetFramesContainer(ppContainer) {
        result := ComCall(4, this, "ptr*", ppContainer, "HRESULT")
        return result
    }
}
