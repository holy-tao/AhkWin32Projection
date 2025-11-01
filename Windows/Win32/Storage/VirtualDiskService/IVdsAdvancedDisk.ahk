#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates and deletes partitions, and modifies partition attributes.
 * @remarks
 * 
  * The relationship between partitions and volumes is complex, and is best described in terms of the software provider (basic or dynamic) that manages the disk. Basic providers support the following three categories of partitions:
  * 
  * <ul>
  * <li>Partitions that are not volumes, because you can neither format them nor assign a drive letter to them. These partitions are MSR partitions, LDM Metadata partitions, and extended partitions. </li>
  * <li>Partitions associated with hidden volumes, which you can format and assign a drive letter to, but which host no user data. Instead, the system uses these partitions for booting, recovery, and so on. The partitions include OEM partitions, ESP partitions on GPT disks, and Unknown partitions. You cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolume">IVdsVolume</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolumemf">IVdsVolumeMF</a> interfaces to format these partitions. Instead, use the <b>IVdsAdvancedDisk</b> interface, which exposes the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-assigndriveletter">AssignDriveLetter</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-deletedriveletter">DeleteDriveLetter</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-formatpartition">FormatPartition</a> methods.
  * 
  * </li>
  * <li>Partitions that do not fall into the preceding two categories hold user data, files, and the installed operating system for the user. These partitions are always volumes; you can format them, assign  drive letters to them, and enumerate through them with the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstvolumew">FindFirstVolume</a> and <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextvolumew">FindNextVolume</a> functions.</li>
  * </ul>
  * In general, dynamic providers  do not map volumes to partitions. The exceptions are system volumes, boot volumes, and volumes for which the caller explicitly requests this mapping. 
  * Only the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-getpartitionproperties">GetPartitionProperties</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-querypartitions">QueryPartitions</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsadvanceddisk-clean">Clean</a> methods are valid operations to be performed on dynamic disks. All other methods fail. Except for the <b>Clean</b> method, configuration-type operations are not valid on dynamic disks.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsadvanceddisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsAdvancedDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsAdvancedDisk
     * @type {Guid}
     */
    static IID => Guid("{6e6f6b40-977c-4069-bddd-ac710059f8c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartitionProperties", "QueryPartitions", "CreatePartition", "DeletePartition", "ChangeAttributes", "AssignDriveLetter", "DeleteDriveLetter", "GetDriveLetter", "FormatPartition", "Clean"]

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Pointer<VDS_PARTITION_PROP>} pPartitionProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-getpartitionproperties
     */
    GetPartitionProperties(ullOffset, pPartitionProp) {
        result := ComCall(3, this, "uint", ullOffset, "ptr", pPartitionProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_PARTITION_PROP>>} ppPartitionPropArray 
     * @param {Pointer<Integer>} plNumberOfPartitions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-querypartitions
     */
    QueryPartitions(ppPartitionPropArray, plNumberOfPartitions) {
        result := ComCall(4, this, "ptr*", ppPartitionPropArray, "int*", plNumberOfPartitions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Integer} ullSize 
     * @param {Pointer<CREATE_PARTITION_PARAMETERS>} para 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-createpartition
     */
    CreatePartition(ullOffset, ullSize, para, ppAsync) {
        result := ComCall(5, this, "uint", ullOffset, "uint", ullSize, "ptr", para, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {BOOL} bForce 
     * @param {BOOL} bForceProtected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-deletepartition
     */
    DeletePartition(ullOffset, bForce, bForceProtected) {
        result := ComCall(6, this, "uint", ullOffset, "int", bForce, "int", bForceProtected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Pointer<CHANGE_ATTRIBUTES_PARAMETERS>} para 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-changeattributes
     */
    ChangeAttributes(ullOffset, para) {
        result := ComCall(7, this, "uint", ullOffset, "ptr", para, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Integer} wcLetter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-assigndriveletter
     */
    AssignDriveLetter(ullOffset, wcLetter) {
        result := ComCall(8, this, "uint", ullOffset, "char", wcLetter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Integer} wcLetter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-deletedriveletter
     */
    DeleteDriveLetter(ullOffset, wcLetter) {
        result := ComCall(9, this, "uint", ullOffset, "char", wcLetter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {PWSTR} pwcLetter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-getdriveletter
     */
    GetDriveLetter(ullOffset, pwcLetter) {
        pwcLetter := pwcLetter is String ? StrPtr(pwcLetter) : pwcLetter

        result := ComCall(10, this, "uint", ullOffset, "ptr", pwcLetter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullOffset 
     * @param {Integer} type 
     * @param {PWSTR} pwszLabel 
     * @param {Integer} dwUnitAllocationSize 
     * @param {BOOL} bForce 
     * @param {BOOL} bQuickFormat 
     * @param {BOOL} bEnableCompression 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-formatpartition
     */
    FormatPartition(ullOffset, type, pwszLabel, dwUnitAllocationSize, bForce, bQuickFormat, bEnableCompression, ppAsync) {
        pwszLabel := pwszLabel is String ? StrPtr(pwszLabel) : pwszLabel

        result := ComCall(11, this, "uint", ullOffset, "int", type, "ptr", pwszLabel, "uint", dwUnitAllocationSize, "int", bForce, "int", bQuickFormat, "int", bEnableCompression, "ptr*", ppAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bForce 
     * @param {BOOL} bForceOEM 
     * @param {BOOL} bFullClean 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsadvanceddisk-clean
     */
    Clean(bForce, bForceOEM, bFullClean, ppAsync) {
        result := ComCall(12, this, "int", bForce, "int", bForceOEM, "int", bFullClean, "ptr*", ppAsync, "HRESULT")
        return result
    }
}
