#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_LARGE_INTEGER.ahk" { CLUSPROP_LARGE_INTEGER }
#Import ".\CLUSPROP_REQUIRED_DEPENDENCY.ahk" { CLUSPROP_REQUIRED_DEPENDENCY }
#Import ".\CLUSPROP_LIST.ahk" { CLUSPROP_LIST }
#Import ".\CLUSPROP_PARTITION_INFO.ahk" { CLUSPROP_PARTITION_INFO }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import ".\CLUSPROP_PARTITION_INFO_EX.ahk" { CLUSPROP_PARTITION_INFO_EX }
#Import ".\CLUSPROP_LONG.ahk" { CLUSPROP_LONG }
#Import ".\CLUSPROP_DWORD.ahk" { CLUSPROP_DWORD }
#Import ".\CLUSPROP_SZ.ahk" { CLUSPROP_SZ }
#Import ".\CLUSPROP_PARTITION_INFO_EX2.ahk" { CLUSPROP_PARTITION_INFO_EX2 }
#Import ".\CLUSPROP_WORD.ahk" { CLUSPROP_WORD }
#Import ".\CLUSPROP_ULARGE_INTEGER.ahk" { CLUSPROP_ULARGE_INTEGER }
#Import ".\CLUSPROP_RESOURCE_CLASS.ahk" { CLUSPROP_RESOURCE_CLASS }
#Import ".\CLUSPROP_RESOURCE_CLASS_INFO.ahk" { CLUSPROP_RESOURCE_CLASS_INFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CLUSPROP_SCSI_ADDRESS.ahk" { CLUSPROP_SCSI_ADDRESS }
#Import ".\CLUSPROP_SECURITY_DESCRIPTOR.ahk" { CLUSPROP_SECURITY_DESCRIPTOR }
#Import ".\CLUSPROP_BINARY.ahk" { CLUSPROP_BINARY }
#Import ".\CLUSPROP_FILETIME.ahk" { CLUSPROP_FILETIME }
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }

/**
 * Used to build or parse a property list or, a value list.
 * @remarks
 * The <b>CLUSPROP_BUFFER_HELPER</b> structure is useful 
 *      in working with property and value lists. Applications can use a generic 
 *      <b>CLUSPROP_BUFFER_HELPER</b> pointer to advance by 
 *      offsets through the entries of a property list or value list, retrieving or setting values without having to cast 
 *      to the appropriate data type.
 * 
 * An alternate structure, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resutil_property_item">RESUTIL_PROPERTY_ITEM</a>, 
 *      can also be used to work with multiple properties.
 * 
 * Use caution when referencing large integer values in <b>DWORD</b>-aligned structures 
 *      such as value lists, property lists, and 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/parameter-blocks">parameter blocks</a>. For Windows Server for Itanium-based 
 *      systems, a naturally-aligned large integer value always begins on an address ending in 0 or 8h. 
 *      <b>DWORD</b> alignment can cause large values to begin on unaligned boundaries (addresses 
 *      ending in 4h or C), which will cause an alignment fault when the data is read or written. You can avoid alignment 
 *      faults by handling the high and low parts of large values separately, or by using local variables, which are 
 *      guaranteed to be naturally aligned.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_buffer_helper
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_BUFFER_HELPER {
    #StructPack 8

    /**
     * Pointer to a buffer containing an array of bytes.
     */
    pb : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'pw', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'pdw', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'pl', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'psz', { type: PWSTR, offset: 0 })
        DefineProp(this.Prototype, 'pList', { type: CLUSPROP_LIST.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pSyntax', { type: CLUSPROP_SYNTAX.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pName', { type: CLUSPROP_SZ.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pValue', { type: CLUSPROP_VALUE.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pBinaryValue', { type: CLUSPROP_BINARY.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pWordValue', { type: CLUSPROP_WORD.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pDwordValue', { type: CLUSPROP_DWORD.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pLongValue', { type: CLUSPROP_LONG.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pULargeIntegerValue', { type: CLUSPROP_ULARGE_INTEGER.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pLargeIntegerValue', { type: CLUSPROP_LARGE_INTEGER.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pStringValue', { type: CLUSPROP_SZ.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pMultiSzValue', { type: CLUSPROP_SZ.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pSecurityDescriptor', { type: CLUSPROP_SECURITY_DESCRIPTOR.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pResourceClassValue', { type: CLUSPROP_RESOURCE_CLASS.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pResourceClassInfoValue', { type: CLUSPROP_RESOURCE_CLASS_INFO.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pDiskSignatureValue', { type: CLUSPROP_DWORD.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pScsiAddressValue', { type: CLUSPROP_SCSI_ADDRESS.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pDiskNumberValue', { type: CLUSPROP_DWORD.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pPartitionInfoValue', { type: CLUSPROP_PARTITION_INFO.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pRequiredDependencyValue', { type: CLUSPROP_REQUIRED_DEPENDENCY.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pPartitionInfoValueEx', { type: CLUSPROP_PARTITION_INFO_EX.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pPartitionInfoValueEx2', { type: CLUSPROP_PARTITION_INFO_EX2.Ptr, offset: 0 })
        DefineProp(this.Prototype, 'pFileTimeValue', { type: CLUSPROP_FILETIME.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
