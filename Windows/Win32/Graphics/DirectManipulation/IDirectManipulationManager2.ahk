#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectManipulationManager.ahk

/**
 * Extends the IDirectManipulationManager interface that provides access to all the Direct Manipulation features and APIs available to the client application.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationmanager2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationManager2 extends IDirectManipulationManager{
    /**
     * The interface identifier for IDirectManipulationManager2
     * @type {Guid}
     */
    static IID => Guid("{fa1005e9-3d16-484c-bfc9-62b61e56ec4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} object 
     * @returns {HRESULT} 
     */
    CreateBehavior(clsid, riid, object) {
        result := ComCall(10, this, "ptr", clsid, "ptr", riid, "ptr", object, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
