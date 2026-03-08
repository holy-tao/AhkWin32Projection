#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeySession.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySession2 extends IMFMediaKeySession{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySession2
     * @type {Guid}
     */
    static IID => Guid("{e9707e05-6d55-4636-b185-3de21210bd75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyStatuses", "Load", "GenerateRequest", "get_Expiration", "Remove", "Shutdown"]

    /**
     * @type {Float} 
     */
    Expiration {
        get => this.get_Expiration()
    }

    /**
     * 
     * @param {Pointer<Pointer<MFMediaKeyStatus>>} pKeyStatusesArray 
     * @param {Pointer<Integer>} puSize 
     * @returns {HRESULT} 
     */
    get_KeyStatuses(pKeyStatusesArray, puSize) {
        pKeyStatusesArrayMarshal := pKeyStatusesArray is VarRef ? "ptr*" : "ptr"
        puSizeMarshal := puSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pKeyStatusesArrayMarshal, pKeyStatusesArray, puSizeMarshal, puSize, "HRESULT")
        return result
    }

    /**
     * Reads texel data without any filtering or sampling.
     * @param {BSTR} bstrSessionId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/dx-graphics-hlsl-to-load
     */
    Load(bstrSessionId) {
        bstrSessionId := bstrSessionId is String ? BSTR.Alloc(bstrSessionId).Value : bstrSessionId

        result := ComCall(9, this, "ptr", bstrSessionId, "int*", &pfLoaded := 0, "HRESULT")
        return pfLoaded
    }

    /**
     * 
     * @param {BSTR} initDataType 
     * @param {Pointer} pbInitData 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    GenerateRequest(initDataType, pbInitData, cb) {
        initDataType := initDataType is String ? BSTR.Alloc(initDataType).Value : initDataType

        result := ComCall(10, this, "ptr", initDataType, "ptr", pbInitData, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Expiration() {
        result := ComCall(11, this, "double*", &dblExpiration := 0, "HRESULT")
        return dblExpiration
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Stops the collector. If the collector is running as a service, stopping the service is the better approach.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-shutdown
     */
    Shutdown() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
