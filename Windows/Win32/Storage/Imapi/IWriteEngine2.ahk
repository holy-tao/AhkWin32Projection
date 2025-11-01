#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to write a data stream to a device.
 * @remarks
 * 
  * To create the <b>MsftWriteEngine2</b> object in a script, use IMAPI2.MsftWriteEngine2 as the program identifier when calling <b>CreateObject</b>.
  * 
  *  It is possible for a power state transition to take place during a burn operation (i.e. user log-off or system suspend) which leads to the  interruption of the burn process and  possible data loss. For programming considerations, see <a href="https://docs.microsoft.com/windows/desktop/imapi/preventing-logoff-or-suspend-during-a-burn">Preventing Logoff or Suspend During a Burn</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iwriteengine2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IWriteEngine2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWriteEngine2
     * @type {Guid}
     */
    static IID => Guid("{27354135-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WriteSection", "CancelWrite", "put_Recorder", "get_Recorder", "put_UseStreamingWrite12", "get_UseStreamingWrite12", "put_StartingSectorsPerSecond", "get_StartingSectorsPerSecond", "put_EndingSectorsPerSecond", "get_EndingSectorsPerSecond", "put_BytesPerSector", "get_BytesPerSector", "get_WriteInProgress"]

    /**
     * 
     * @param {IStream} data 
     * @param {Integer} startingBlockAddress 
     * @param {Integer} numberOfBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-writesection
     */
    WriteSection(data, startingBlockAddress, numberOfBlocks) {
        result := ComCall(7, this, "ptr", data, "int", startingBlockAddress, "int", numberOfBlocks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-cancelwrite
     */
    CancelWrite() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDiscRecorder2Ex} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-put_recorder
     */
    put_Recorder(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2Ex>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_recorder
     */
    get_Recorder(value) {
        result := ComCall(10, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-put_usestreamingwrite12
     */
    put_UseStreamingWrite12(value) {
        result := ComCall(11, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_usestreamingwrite12
     */
    get_UseStreamingWrite12(value) {
        result := ComCall(12, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-put_startingsectorspersecond
     */
    put_StartingSectorsPerSecond(value) {
        result := ComCall(13, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_startingsectorspersecond
     */
    get_StartingSectorsPerSecond(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-put_endingsectorspersecond
     */
    put_EndingSectorsPerSecond(value) {
        result := ComCall(15, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_endingsectorspersecond
     */
    get_EndingSectorsPerSecond(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-put_bytespersector
     */
    put_BytesPerSector(value) {
        result := ComCall(17, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_bytespersector
     */
    get_BytesPerSector(value) {
        valueMarshal := value is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, valueMarshal, value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-iwriteengine2-get_writeinprogress
     */
    get_WriteInProgress(value) {
        result := ComCall(19, this, "ptr", value, "HRESULT")
        return result
    }
}
