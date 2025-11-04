#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * An IInkDesktopHost object enables ink input, processing, and rendering through the creation of an app thread to host an IInkPresenterDesktop object and insert it into the app's DirectComposition visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nn-inkpresenterdesktop-iinkdesktophost
 * @namespace Windows.Win32.UI.Input.Ink
 * @version v4.0.30319
 */
class IInkDesktopHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkDesktopHost
     * @type {Guid}
     */
    static IID => Guid("{4ce7d875-a981-4140-a1ff-ad93258e8d59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueueWorkItem", "CreateInkPresenter", "CreateAndInitializeInkPresenter"]

    /**
     * 
     * @param {IInkHostWorkItem} workItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-queueworkitem
     */
    QueueWorkItem(workItem) {
        result := ComCall(3, this, "ptr", workItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createinkpresenter
     */
    CreateInkPresenter(riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} rootVisual 
     * @param {Float} width 
     * @param {Float} height 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createandinitializeinkpresenter
     */
    CreateAndInitializeInkPresenter(rootVisual, width, height, riid, ppv) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", rootVisual, "float", width, "float", height, "ptr", riid, ppvMarshal, ppv, "HRESULT")
        return result
    }
}
