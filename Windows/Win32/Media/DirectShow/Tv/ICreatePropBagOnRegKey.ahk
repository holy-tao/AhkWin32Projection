#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The ICreatePropBagOnRegKey interface creates a property bag that can store information in the system registry.Use this interface to store the default tune request in the registry.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ICreatePropBagOnRegKey)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//regbag/nn-regbag-icreatepropbagonregkey
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ICreatePropBagOnRegKey extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreatePropBagOnRegKey
     * @type {Guid}
     */
    static IID => Guid("{8a674b48-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The class identifier for CreatePropBagOnRegKey
     * @type {Guid}
     */
    static CLSID => Guid("{8a674b49-1f63-11d3-b64c-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * The Create method creates a property bag that can store information in the system registry.
     * @param {HKEY} hkey Specifies a handle to the registry key.
     * @param {PWSTR} subkey Specifies the subkey.
     * @param {Integer} ulOptions Reserved; must be zero.
     * @param {Integer} samDesired Specifies the desired access rights to the key. The value can be any combination of flags from the <i>samDesired</i> parameter in the Win32 <b>RegOpenKeyEx</b> function.
     * @param {Pointer<Guid>} iid Specifies the interface identifier (IID) of a property bag interface. Use the value IID_IPropertyBag or IID_IPropertyBag2.
     * @returns {Pointer<Void>} Address of a variable that receives the interface specified by the <i>iid</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//regbag/nf-regbag-icreatepropbagonregkey-create
     */
    Create(hkey, subkey, ulOptions, samDesired, iid) {
        hkey := hkey is Win32Handle ? NumGet(hkey, "ptr") : hkey
        subkey := subkey is String ? StrPtr(subkey) : subkey

        result := ComCall(3, this, "ptr", hkey, "ptr", subkey, "uint", ulOptions, "uint", samDesired, "ptr", iid, "ptr*", &ppBag := 0, "HRESULT")
        return ppBag
    }
}
