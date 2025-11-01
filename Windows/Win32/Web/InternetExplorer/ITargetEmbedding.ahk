#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetEmbedding extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetEmbedding
     * @type {Guid}
     */
    static IID => Guid("{548793c0-9e74-11cf-9655-00a0c9034923}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTargetFrame"]

    /**
     * 
     * @param {Pointer<ITargetFrame>} ppTargetFrame 
     * @returns {HRESULT} 
     */
    GetTargetFrame(ppTargetFrame) {
        result := ComCall(3, this, "ptr*", ppTargetFrame, "HRESULT")
        return result
    }
}
