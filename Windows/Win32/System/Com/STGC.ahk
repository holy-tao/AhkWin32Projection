#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specify the conditions for performing the commit operation in the IStorage::Commit and IStream::Commit methods.
 * @remarks
 * 
 * You can specify <b>STGC_DEFAULT</b> or some combination of <b>STGC_OVERWRITE</b>, <b>STGC_ONLYIFCURRENT</b>, and <b>STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE</b> for normal commit operations. You can specify <b>STGC_CONSOLIDATE</b> with any other STGC flags.
 * 
 * Typically, use <b>STGC_ONLYIFCURRENT</b> to protect the storage object in cases where more than one user can edit the object simultaneously.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtypes/ne-wtypes-stgc
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class STGC{

    /**
     * You can specify this condition with <b>STGC_CONSOLIDATE</b>, or some combination of the other three flags in this list of elements. Use this value to increase the readability of code.
     * @type {Integer (Int32)}
     */
    static STGC_DEFAULT => 0

    /**
     * The commit operation can overwrite existing data to reduce overall space requirements. This value is not recommended for typical usage because it is not as robust as the default value. In this case, it is possible for the commit operation to fail after the old data is overwritten, but before the new data is completely committed. Then, neither the old version nor the new version of the storage object will be intact. 
 * 
 * 
 * 
 * 						
 * 
 * You can use this value in the following cases:
 * 
 * <ul>
 * <li>The user is willing to risk losing the data.</li>
 * <li>The low-memory save sequence will be used to safely save the storage object to a smaller file.</li>
 * <li>A previous commit returned <b>STG_E_MEDIUMFULL</b>, but overwriting the existing data would provide enough space to commit changes to the storage object.</li>
 * </ul>
 * Be aware that the commit operation verifies that adequate space exists before any overwriting occurs. Thus, even with this value specified, if the commit operation fails due to space requirements, the old data is safe. It is possible, however, for data loss to occur with the <b>STGC_OVERWRITE</b> value specified if the commit operation fails for any reason other than lack of disk space.
     * @type {Integer (Int32)}
     */
    static STGC_OVERWRITE => 1

    /**
     * Prevents multiple users of a storage object from overwriting each other's changes. The commit operation occurs only if there have been no changes to the saved storage object because the user most recently opened it. Thus, the saved version of the storage object is the same version that the user has been editing. If other users have changed the storage object, the commit operation fails and returns the STG_E_NOTCURRENT value. To override this behavior, call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-commit">IStorage::Commit</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-commit">IStream::Commit</a> method again using the <b>STGC_DEFAULT</b> value.
     * @type {Integer (Int32)}
     */
    static STGC_ONLYIFCURRENT => 2

    /**
     * Commits the changes to a write-behind disk cache, but does not save the cache to the disk. In a write-behind disk cache, the operation that writes to disk actually writes to a disk cache, thus increasing performance. The cache is eventually written to the disk, but usually not until after the write operation has already returned. The performance increase comes at the expense of an increased risk of losing data if a problem occurs before the cache is saved and the data in the cache is lost. 
 * 
 * 
 * 
 * 
 * If you do not specify this value, then committing changes to root-level storage objects is robust even if a disk cache is used. The two-phase commit process ensures that data is stored on the disk and not just to the disk cache.
     * @type {Integer (Int32)}
     */
    static STGC_DANGEROUSLYCOMMITMERELYTODISKCACHE => 4

    /**
     * Windows 2000 and Windows XP: Indicates that a storage should be consolidated after it is committed, resulting in a smaller file on disk. This flag is valid only on the outermost storage object that has been opened in transacted mode. It is not valid for streams. The <b>STGC_CONSOLIDATE</b> flag can be combined with any other STGC flags.
     * @type {Integer (Int32)}
     */
    static STGC_CONSOLIDATE => 8
}
