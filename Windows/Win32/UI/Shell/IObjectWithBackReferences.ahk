#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for interacting with back references held by an object.
 * @remarks
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * When an object contains forward references to child objects that have back references to the parent object, circular references can occur. To break this circle, the parent object needs to keep track of back references from child objects.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * This interface should be implemented by Shell data source objects (objects that implement <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>) that hold references to other objects in a way that might result in reference cycles. For example, an object that maintains references to other data source objects that are cached as the result of binding operations should implement this interface.
 * 
 * This interface was available in Windows Vista with Service Pack 1 (SP1), but it was not declared in a public header until Windows 7. For use in Windows Vista with SP1, the following Interface Definition Language (IDL) fragment describes this interface, including its IID.
 *                 
 *                 
 * 
 * 
 * ```cpp
 * object,
 *     uuid(321a6a6a-d61f-4bf3-97ae-14be2986bb36),
 *     pointer_default(unique)
 * ]
 * interface IObjectWithBackReferences : IUnknown
 * {
 *     HRESULT RemoveBackReferences();
 * }
 * 
 * ```
 * 
 * 
 * The following C++ fragment can be used to enable access to this interface.
 *                 
 * 
 * 
 * ```cpp
 * struct 
 *     __declspec(uuid("321a6a6a-d61f-4bf3-97ae-14be2986bb36")) 
 *     __declspec(novtable)
 * IObjectWithBackReferences : public IUnknown
 * {
 *     public:
 *         virtual HRESULT __stdcall RemoveBackReferences() = 0;
 * };
 * 
 * ```
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iobjectwithbackreferences
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IObjectWithBackReferences extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectWithBackReferences
     * @type {Guid}
     */
    static IID => Guid("{321a6a6a-d61f-4bf3-97ae-14be2986bb36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RemoveBackReferences"]

    /**
     * Removes all back references held by an object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iobjectwithbackreferences-removebackreferences
     */
    RemoveBackReferences() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
