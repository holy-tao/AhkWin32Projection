#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\LimitedAccessFeatureRequestResult.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ILimitedAccessFeaturesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILimitedAccessFeaturesStatics
     * @type {Guid}
     */
    static IID => Guid("{8be612d4-302b-5fbf-a632-1a99e43e8925}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryUnlockFeature"]

    /**
     * 
     * @param {HSTRING} featureId 
     * @param {HSTRING} token 
     * @param {HSTRING} attestation 
     * @returns {LimitedAccessFeatureRequestResult} 
     */
    TryUnlockFeature(featureId, token, attestation) {
        if(featureId is String) {
            pin := HSTRING.Create(featureId)
            featureId := pin.Value
        }
        featureId := featureId is Win32Handle ? NumGet(featureId, "ptr") : featureId
        if(token is String) {
            pin := HSTRING.Create(token)
            token := pin.Value
        }
        token := token is Win32Handle ? NumGet(token, "ptr") : token
        if(attestation is String) {
            pin := HSTRING.Create(attestation)
            attestation := pin.Value
        }
        attestation := attestation is Win32Handle ? NumGet(attestation, "ptr") : attestation

        result := ComCall(6, this, "ptr", featureId, "ptr", token, "ptr", attestation, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LimitedAccessFeatureRequestResult(result_)
    }
}
