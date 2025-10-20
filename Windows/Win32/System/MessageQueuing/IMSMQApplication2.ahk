#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMSMQApplication.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQApplication2 extends IMSMQApplication{
    /**
     * The interface identifier for IMSMQApplication2
     * @type {Guid}
     */
    static IID => Guid("{12a30900-7300-11d2-b0e6-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} ExternalCertificate 
     * @returns {HRESULT} 
     */
    RegisterCertificate(Flags, ExternalCertificate) {
        result := ComCall(8, this, "ptr", Flags, "ptr", ExternalCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @param {Pointer<BSTR>} pbstrMachineName 
     * @returns {HRESULT} 
     */
    MachineNameOfMachineId(bstrGuid, pbstrMachineName) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        result := ComCall(9, this, "ptr", bstrGuid, "ptr", pbstrMachineName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} psMSMQVersionMajor 
     * @returns {HRESULT} 
     */
    get_MSMQVersionMajor(psMSMQVersionMajor) {
        result := ComCall(10, this, "short*", psMSMQVersionMajor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} psMSMQVersionMinor 
     * @returns {HRESULT} 
     */
    get_MSMQVersionMinor(psMSMQVersionMinor) {
        result := ComCall(11, this, "short*", psMSMQVersionMinor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int16>} psMSMQVersionBuild 
     * @returns {HRESULT} 
     */
    get_MSMQVersionBuild(psMSMQVersionBuild) {
        result := ComCall(12, this, "short*", psMSMQVersionBuild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsDsEnabled 
     * @returns {HRESULT} 
     */
    get_IsDsEnabled(pfIsDsEnabled) {
        result := ComCall(13, this, "ptr", pfIsDsEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppcolProperties 
     * @returns {HRESULT} 
     */
    get_Properties(ppcolProperties) {
        result := ComCall(14, this, "ptr", ppcolProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
