#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Returns results from the asynchronous WinBioIdentifyWithCallback function.
 * @remarks
 * Currently, the Windows Biometric Framework supports only fingerprint readers. Therefore, if an operation fails and returns additional information in a <b>WINBIO_REJECT_DETAIL</b> constant, it will be one of the following values:<ul>
 * <li>WINBIO_FP_TOO_HIGH</li>
 * <li>WINBIO_FP_TOO_LOW</li>
 * <li>WINBIO_FP_TOO_LEFT</li>
 * <li>WINBIO_FP_TOO_RIGHT</li>
 * <li>WINBIO_FP_TOO_FAST</li>
 * <li>WINBIO_FP_TOO_SLOW</li>
 * <li>WINBIO_FP_POOR_QUALITY</li>
 * <li>WINBIO_FP_TOO_SKEWED</li>
 * <li>WINBIO_FP_TOO_SHORT</li>
 * <li>WINBIO_FP_MERGE_FAILURE</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio/nc-winbio-pwinbio_identify_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PWINBIO_IDENTIFY_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} IdentifyCallbackContext 
     * @param {HRESULT} OperationStatus 
     * @param {Integer} UnitId 
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Integer} SubFactor 
     * @param {Integer} RejectDetail 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(IdentifyCallbackContext, OperationStatus, UnitId, Identity, SubFactor, RejectDetail) {
        IdentifyCallbackContextMarshal := IdentifyCallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, IdentifyCallbackContextMarshal, IdentifyCallbackContext, "int", OperationStatus, "uint", UnitId, "ptr", Identity, "char", SubFactor, "uint", RejectDetail)
    }
}
