#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceFactory
     * @type {Guid}
     */
    static IID => Guid("{61f307d3-d34e-4e7c-8374-3ba4de23cccb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromGlobalState", "ApplyToGlobalState", "SetFlags", "GetFlags", "GetConfigurationInterface", "EnableExperimentalFeatures", "CreateDevice"]

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeFromGlobalState() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ApplyToGlobalState() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(flags) {
        result := ComCall(5, this, "int", flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(6, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsid 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @returns {HRESULT} 
     */
    GetConfigurationInterface(clsid, iid, ppv) {
        result := ComCall(7, this, "ptr", clsid, "ptr", iid, "ptr*", ppv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NumFeatures 
     * @param {Pointer<Guid>} pIIDs 
     * @param {Pointer<Void>} pConfigurationStructs 
     * @param {Pointer<Integer>} pConfigurationStructSizes 
     * @returns {HRESULT} 
     */
    EnableExperimentalFeatures(NumFeatures, pIIDs, pConfigurationStructs, pConfigurationStructSizes) {
        result := ComCall(8, this, "uint", NumFeatures, "ptr", pIIDs, "ptr", pConfigurationStructs, "uint*", pConfigurationStructSizes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} adapter 
     * @param {Integer} FeatureLevel 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDevice 
     * @returns {HRESULT} 
     */
    CreateDevice(adapter, FeatureLevel, riid, ppvDevice) {
        result := ComCall(9, this, "ptr", adapter, "int", FeatureLevel, "ptr", riid, "ptr*", ppvDevice, "HRESULT")
        return result
    }
}
