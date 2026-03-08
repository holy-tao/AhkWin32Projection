#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsPartIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsPartIterator
     * @type {Guid}
     */
    static IID => Guid("{0021d3cd-af6f-42ab-9999-14bc82a62d2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Current", "IsDone", "Next"]

    /**
     * Resets the time-out period or other mechanism that TPM manufacturers implement to protect against dictionary attacks on TPM authorization values.
     * @remarks
     * This method calls the TPM\_ResetLockValue command on the TPM. The exact behavior of this method varies among TPM manufacturers. Documentation from the computer or TPM manufacturer may provide additional information on the implementation of the anti-dictionary attack mechanism.
     * 
     * In general, manufacturers can detect dictionary attacks by keeping track of failed authentications. If the number or frequency of failures become high enough, the TPM will lock out further commands for a certain time. Generally, the initial time-out period will be short, to allow a legitimate user a chance to correct the situation. If failures continue, the duration of each subsequent time-out period may increase rapidly.
     * 
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/SecProv/resetauthlockout-win32-tpm
     */
    Reset() {
        ComCall(3, this)
    }

    /**
     * The CurrentAngle property sets or retrieves the current angle in an angle block.
     * @remarks
     * This property is read/write with no default value.
     * @param {Pointer<BSTR>} pUri 
     * @param {Pointer<IUnknown>} ppXpsPart 
     * @returns {HRESULT} Returns an integer value representing the angle. Must be a value from 1 through 9.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/currentangle-property
     */
    Current(pUri, ppXpsPart) {
        result := ComCall(4, this, "ptr", pUri, "ptr*", ppXpsPart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDone() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Next() {
        ComCall(6, this)
    }
}
