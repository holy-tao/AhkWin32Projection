#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectManipulationManager2.ahk

/**
 * Extends the IDirectManipulationManager2 interface that provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationmanager3
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationManager3 extends IDirectManipulationManager2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationManager3
     * @type {Guid}
     */
    static IID => Guid("{2cb6b33d-ffe8-488c-b750-fbdfe88dca8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetService"]

    /**
     * Retrieves an IDirectManipulationDeferContactService object.
     * @param {Pointer<Guid>} clsid The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> CLSID.
     * @param {Pointer<Guid>} riid The IID of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> to retrieve.
     * @returns {Pointer<Void>} The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice">IDirectManipulationDeferContactService</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationmanager3-getservice
     */
    GetService(clsid, riid) {
        result := ComCall(11, this, "ptr", clsid, "ptr", riid, "ptr*", &object := 0, "HRESULT")
        return object
    }
}
