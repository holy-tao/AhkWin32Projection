#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class PWRSCHEMESENUMPROC_V1 extends IUnknown {

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
     * @param {Integer} Index 
     * @param {Integer} NameSize 
     * @param {Pointer} Name 
     * @param {Integer} DescriptionSize 
     * @param {Pointer} Description 
     * @param {Pointer<POWER_POLICY>} Policy 
     * @param {LPARAM} Context_ 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Index, NameSize, Name, DescriptionSize, Description, Policy, Context_) {
        Context_ := Context_ is Win32Handle ? NumGet(Context_, "ptr") : Context_

        result := ComCall(3, this, "uint", Index, "uint", NameSize, "ptr", Name, "uint", DescriptionSize, "ptr", Description, "ptr", Policy, "ptr", Context_, "char")
        return result
    }
}
