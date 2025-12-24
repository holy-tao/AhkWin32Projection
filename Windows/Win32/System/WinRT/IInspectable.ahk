#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HSTRING.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides functionality required for all Windows Runtime classes.
 * @remarks
 * 
 * <b>IInspectable</b> methods have no effect on COM apartments and are safe to call from user interface threads.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//inspectable/nn-inspectable-iinspectable
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
     * The  <a href="/windows/desktop/WinRT/hstring">HSTRING</a> was created successfully.
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
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-iinspectable-getiids
     */
    GetIids(iidCount, iids) {
        iidCountMarshal := iidCount is VarRef ? "uint*" : "ptr"
        iidsMarshal := iids is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, iidCountMarshal, iidCount, iidsMarshal, iids, "HRESULT")
        return result
    }

    /**
     * Gets the fully qualified name of the current Windows Runtime object.
     * @returns {HSTRING} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinRT/hstring">HSTRING</a>*</b>
     * 
     * The fully qualified name of the current Windows Runtime object.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-iinspectable-getruntimeclassname
     */
    GetRuntimeClassName() {
        className := HSTRING()
        result := ComCall(4, this, "ptr", className, "HRESULT")
        return className
    }

    /**
     * Gets the trust level of the current Windows Runtime object.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/ne-inspectable-trustlevel">TrustLevel</a>*</b>
     * 
     * The trust level of the current Windows Runtime object. The default is <b>BaseLevel</b>.
     * @see https://docs.microsoft.com/windows/win32/api//inspectable/nf-inspectable-iinspectable-gettrustlevel
     */
    GetTrustLevel() {
        result := ComCall(5, this, "int*", &trustLevel := 0, "HRESULT")
        return trustLevel
    }
}
