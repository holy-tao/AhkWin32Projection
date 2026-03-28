#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HSTRING.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides functionality required for all Windows Runtime classes.
 * @remarks
 * <b>IInspectable</b> methods have no effect on COM apartments and are safe to call from user interface threads.
 * @see https://learn.microsoft.com/windows/win32/api/inspectable/nn-inspectable-iinspectable
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IInspectable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInspectable
     * @type {Guid}
     */
    static IID => Guid("{af86e2e0-b12d-4c6a-9c5a-d7aa65101e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIids", "GetRuntimeClassName", "GetTrustLevel"]

    /**
     * Gets the interfaces that are implemented by the current Windows Runtime class.
     * @remarks
     * Use the <b>GetIids</b> method to discover the interfaces that are implemented by a Windows Runtime object.
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> call on any IID in the <i>iids</i> array must succeed.
     * 
     * The caller is responsible for freeing the IID array by using the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @param {Pointer<Integer>} iidCount Type: <b>ULONG*</b>
     * 
     * The number of interfaces that are implemented by the current Windows Runtime object, excluding the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> implementations.
     * @param {Pointer<Pointer<Guid>>} iids Type: <b>IID**</b>
     * 
     * A pointer to an array that contains an IID for   each interface implemented by the current Windows Runtime object. The <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> interfaces are excluded.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This function can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The  <a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a> was created successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to allocate <i>iids</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-getiids
     */
    GetIids(iidCount, iids) {
        iidCountMarshal := iidCount is VarRef ? "uint*" : "ptr"
        iidsMarshal := iids is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, iidCountMarshal, iidCount, iidsMarshal, iids, "HRESULT")
        return result
    }

    /**
     * Gets the fully qualified name of the current Windows Runtime object.
     * @remarks
     * Use the <b>GetRuntimeClassName</b> method to retrieve the namespace-qualified name of a Windows Runtime object.
     * 
     * The caller is responsible for freeing the <i>className</i> string by using the <a href="https://docs.microsoft.com/windows/desktop/api/winstring/nf-winstring-windowsdeletestring">WindowsDeleteString</a> function.   
     * 
     * The following table shows example class name strings that could be returned by the <b>GetRuntimeClassName</b> method.
     * 
     * 
     * <table>
     * <tr>
     * <th>Example Class Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>Fabrikam.Kitchen.IToaster</td>
     * <td>An interface in the Fabrikam.Kitchen namespace. </td>
     * </tr>
     * <tr>
     * <td>Fabrikam.Kitchen.Chef</td>
     * <td>An class in the Fabrikam.Kitchen namespace. </td>
     * </tr>
     * <tr>
     * <td>Windows.Foundation.Collections.IVector`1&lt;TailspinToys.IStore&gt;</td>
     * <td>A vector of TailspinToys.IStore interfaces. </td>
     * </tr>
     * <tr>
     * <td>Windows.Foundation.Collections.IVector`1&lt;Windows.Foundation.Collections.IMap`2&lt;String, TailspinToys.IStore&gt;&gt;</td>
     * <td>A vector of maps of strings to TailspinToys.IStore interfaces. </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * The <b>GetRuntimeClassName</b> method provides the most specific type information that the server object guarantees that it implements. The type name may be a runtime class name, interface group name, interface name, or parameterized interface name. 
     * 
     * The <b>GetRuntimeClassName</b> method returns <b>E_ILLEGAL_METHOD_CALL</b> if the class name refers to a class factory or a static interface.
     * @returns {HSTRING} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * The fully qualified name of the current Windows Runtime object.
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-getruntimeclassname
     */
    GetRuntimeClassName() {
        className := HSTRING()
        result := ComCall(4, this, "ptr", className, "HRESULT")
        return className
    }

    /**
     * Gets the trust level of the current Windows Runtime object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/inspectable/nf-inspectable-iinspectable-gettrustlevel
     */
    GetTrustLevel() {
        result := ComCall(5, this, "int*", &_trustLevel := 0, "HRESULT")
        return _trustLevel
    }
}
