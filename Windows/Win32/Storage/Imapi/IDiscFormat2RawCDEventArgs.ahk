#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWriteEngine2EventArgs.ahk

/**
 * Use this interface to retrieve information about the current write operation.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2rawcdeventargs
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2RawCDEventArgs extends IWriteEngine2EventArgs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2RawCDEventArgs
     * @type {Guid}
     */
    static IID => Guid("{27354143-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentAction", "get_ElapsedTime", "get_RemainingTime"]

    /**
     * @type {Integer} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * @type {Integer} 
     */
    ElapsedTime {
        get => this.get_ElapsedTime()
    }

    /**
     * @type {Integer} 
     */
    RemainingTime {
        get => this.get_RemainingTime()
    }

    /**
     * Retrieves the current write action being performed.
     * @returns {Integer} Current write action being performed. For a list of possible actions, see  the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_format2_raw_cd_write_action">IMAPI_FORMAT2_RAW_CD_WRITE_ACTION</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_currentaction
     */
    get_CurrentAction() {
        result := ComCall(14, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the total elapsed time of the write operation.
     * @returns {Integer} Elapsed time, in seconds, of the write operation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_elapsedtime
     */
    get_ElapsedTime() {
        result := ComCall(15, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the estimated remaining time of the write operation.
     * @returns {Integer} Estimated time, in seconds, needed for the remainder of the write operation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2rawcdeventargs-get_remainingtime
     */
    get_RemainingTime() {
        result := ComCall(16, this, "int*", &value := 0, "HRESULT")
        return value
    }
}
