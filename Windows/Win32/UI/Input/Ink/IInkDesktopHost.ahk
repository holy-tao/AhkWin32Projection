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
     * Add an ink operation to a work queue for execution on the IInkDesktopHost thread.
     * @param {IInkHostWorkItem} workItem An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkhostworkitem">IInkHostWorkItem</a> object representing an ink operation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-queueworkitem
     */
    QueueWorkItem(workItem) {
        result := ComCall(3, this, "ptr", workItem, "HRESULT")
        return result
    }

    /**
     * Creates an IInkPresenterDesktop object on an application thread.
     * @param {Pointer<Guid>} riid A reference to the interface identifier of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop">IInkPresenterDesktop</a> object.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer identified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createinkpresenter
     */
    CreateInkPresenter(riid) {
        result := ComCall(4, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates an IInkPresenterDesktop object on an application thread, connects it to the app's DirectComposition visual tree, and sets the size of the object.
     * @param {IUnknown} rootVisual The <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a> of the app.
     * @param {Float} width The width, in pixels, of the inking area.
     * @param {Float} height The height, in pixels, of the inking area.
     * @param {Pointer<Guid>} riid A reference to the interface identifier of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/inkpresenterdesktop/nn-inkpresenterdesktop-iinkpresenterdesktop">IInkPresenterDesktop</a> object.
     * @returns {Pointer<Void>} Address of a pointer variable that receives the interface pointer identified by <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//inkpresenterdesktop/nf-inkpresenterdesktop-iinkdesktophost-createandinitializeinkpresenter
     */
    CreateAndInitializeInkPresenter(rootVisual, width, height, riid) {
        result := ComCall(5, this, "ptr", rootVisual, "float", width, "float", height, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
