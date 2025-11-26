#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that creates an object of a specified class.
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-icreateobject
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class ICreateObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateObject
     * @type {Guid}
     */
    static IID => Guid("{75121952-e0d0-43e5-9380-1d80483acf72}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateObject"]

    /**
     * Creates a local object of a specified class and returns a pointer to a specified interface on the object.
     * @param {Pointer<Guid>} clsid Type: <b>REFCLSID</b>
     * 
     * A reference to a CLSID.
     * @param {IUnknown} pUnkOuter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface that aggregates the object created by this function, or <b>NULL</b> if no aggregation is desired.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface the created object should return.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * When this method returns, contains the address of the pointer to the interface requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-icreateobject-createobject
     */
    CreateObject(clsid, pUnkOuter, riid) {
        result := ComCall(3, this, "ptr", clsid, "ptr", pUnkOuter, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
