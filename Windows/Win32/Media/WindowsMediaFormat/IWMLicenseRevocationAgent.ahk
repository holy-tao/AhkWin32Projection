#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMLicenseRevocationAgent interface handles messages from a DRM license server that involve license revocation.IWMLicenseRevocationAgent is the primary interface of the license revocation agent object.
 * @remarks
 * 
  * License revocation enables a license issuer to remove licenses from a computer.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmlicenserevocationagent
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMLicenseRevocationAgent extends IUnknown{
    /**
     * The interface identifier for IWMLicenseRevocationAgent
     * @type {Guid}
     */
    static IID => Guid("{6967f2c9-4e26-4b57-8894-799880f7ac7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pMachineID 
     * @param {Integer} dwMachineIDLength 
     * @param {Pointer<Byte>} pChallenge 
     * @param {Integer} dwChallengeLength 
     * @param {Pointer<Byte>} pChallengeOutput 
     * @param {Pointer<UInt32>} pdwChallengeOutputLength 
     * @returns {HRESULT} 
     */
    GetLRBChallenge(pMachineID, dwMachineIDLength, pChallenge, dwChallengeLength, pChallengeOutput, pdwChallengeOutputLength) {
        result := ComCall(3, this, "char*", pMachineID, "uint", dwMachineIDLength, "char*", pChallenge, "uint", dwChallengeLength, "char*", pChallengeOutput, "uint*", pdwChallengeOutputLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pSignedLRB 
     * @param {Integer} dwSignedLRBLength 
     * @param {Pointer<Byte>} pSignedACK 
     * @param {Pointer<UInt32>} pdwSignedACKLength 
     * @returns {HRESULT} 
     */
    ProcessLRB(pSignedLRB, dwSignedLRBLength, pSignedACK, pdwSignedACKLength) {
        result := ComCall(4, this, "char*", pSignedLRB, "uint", dwSignedLRBLength, "char*", pSignedACK, "uint*", pdwSignedACKLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
