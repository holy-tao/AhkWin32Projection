#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetContainer extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppszFrameSrc 
     * @returns {HRESULT} 
     */
    GetFrameUrl(ppszFrameSrc) {
        result := ComCall(3, this, "ptr", ppszFrameSrc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleContainer>} ppContainer 
     * @returns {HRESULT} 
     */
    GetFramesContainer(ppContainer) {
        result := ComCall(4, this, "ptr", ppContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
