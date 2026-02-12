#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLUSTER_REG_READ_BATCH_ADD_COMMAND extends IUnknown {

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
     * @param {HREGREADBATCH} hRegReadBatch_ 
     * @param {PWSTR} wzSubkeyName 
     * @param {PWSTR} wzValueName 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hRegReadBatch_, wzSubkeyName, wzValueName) {
        hRegReadBatch_ := hRegReadBatch_ is Win32Handle ? NumGet(hRegReadBatch_, "ptr") : hRegReadBatch_
        wzSubkeyName := wzSubkeyName is String ? StrPtr(wzSubkeyName) : wzSubkeyName
        wzValueName := wzValueName is String ? StrPtr(wzValueName) : wzValueName

        result := ComCall(3, this, "ptr", hRegReadBatch_, "ptr", wzSubkeyName, "ptr", wzValueName, "int")
        return result
    }
}
