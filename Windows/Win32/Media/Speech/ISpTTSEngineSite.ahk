#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpEventSink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTTSEngineSite extends ISpEventSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpTTSEngineSite
     * @type {Guid}
     */
    static IID => Guid("{9880499b-cce9-11d2-b503-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActions", "Write", "GetRate", "GetVolume", "GetSkipInfo", "CompleteSkip"]

    /**
     * 
     * @returns {Integer} 
     */
    GetActions() {
        result := ComCall(5, this, "uint")
        return result
    }

    /**
     * The WriteBackRootHintDatafile method writes the RootHints back to the DNS Cache file.
     * @param {Pointer<Void>} pBuff 
     * @param {Integer} cb 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/DNS/microsoftdns-roothints-writebackroothintdatafile
     */
    Write(pBuff, cb) {
        pBuffMarshal := pBuff is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pBuffMarshal, pBuff, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRate() {
        result := ComCall(7, this, "int*", &pRateAdjust := 0, "HRESULT")
        return pRateAdjust
    }

    /**
     * Retrieves information about the file system and volume associated with the specified root directory. (ANSI)
     * @remarks
     * When a user attempts to get information about a floppy drive that does not have a floppy disk, or a CD-ROM
     *      drive that does not have a compact disc, the system displays a message box for the user to insert a floppy disk
     *      or a compact disc, respectively. To prevent the system from displaying this message box, call the
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function with
     *      <b>SEM_FAILCRITICALERRORS</b>.
     * 
     * The <b>FILE_VOL_IS_COMPRESSED</b> flag is the only indicator of volume-based compression. The
     *      file system name is not altered to indicate compression, for example, this flag is returned set on a DoubleSpace
     *      volume. When compression is volume-based, an entire volume is  compressed or not compressed.
     * 
     * The <b>FILE_FILE_COMPRESSION</b> flag indicates whether a file system supports file-based
     *      compression. When compression is file-based, individual files can be compressed or not compressed.
     * 
     * The <b>FILE_FILE_COMPRESSION</b> and <b>FILE_VOL_IS_COMPRESSED</b> flags are
     *      mutually exclusive. Both bits cannot be returned set.
     * 
     * The maximum component length value that is stored in <i>lpMaximumComponentLength</i> is the
     *      only indicator that a volume supports longer-than-normal FAT file system (or other file system) file names. The
     *      file system name is not altered to indicate support for long file names.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getcompressedfilesizea">GetCompressedFileSize</a> function obtains the
     *      compressed size of a file. The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a>
     *      function can determine whether an individual file is compressed.
     * 
     * Symbolic link behavior—
     * 
     * If the path points to a symbolic link, the function returns volume information for the target.
     * 
     * Starting with Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * SMB does not support volume management functions.
     * 
     * <h3><a id="Transacted_Operations"></a><a id="transacted_operations"></a><a id="TRANSACTED_OPERATIONS"></a>Transacted Operations</h3>
     * If the volume supports file system transactions, the function returns
     *       <b>FILE_SUPPORTS_TRANSACTIONS</b> in <i>lpFileSystemFlags</i>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The fileapi.h header defines GetVolumeInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumeinformationa
     */
    GetVolume() {
        result := ComCall(8, this, "ushort*", &pusVolume := 0, "HRESULT")
        return pusVolume
    }

    /**
     * 
     * @param {Pointer<Integer>} peType 
     * @param {Pointer<Integer>} plNumItems 
     * @returns {HRESULT} 
     */
    GetSkipInfo(peType, plNumItems) {
        peTypeMarshal := peType is VarRef ? "int*" : "ptr"
        plNumItemsMarshal := plNumItems is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, peTypeMarshal, peType, plNumItemsMarshal, plNumItems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulNumSkipped 
     * @returns {HRESULT} 
     */
    CompleteSkip(ulNumSkipped) {
        result := ComCall(10, this, "int", ulNumSkipped, "HRESULT")
        return result
    }
}
