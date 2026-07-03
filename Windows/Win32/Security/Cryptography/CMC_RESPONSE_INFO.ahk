#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMC_TAGGED_ATTRIBUTE.ahk" { CMC_TAGGED_ATTRIBUTE }
#Import ".\CMC_TAGGED_CONTENT_INFO.ahk" { CMC_TAGGED_CONTENT_INFO }
#Import ".\CMC_TAGGED_OTHER_MSG.ahk" { CMC_TAGGED_OTHER_MSG }

/**
 * Provides a means of communicating different pieces of tagged information. (CMC_RESPONSE_INFO)
 * @remarks
 * All tagged arrays are optional.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_response_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_RESPONSE_INFO {
    #StructPack 8

    /**
     * Count of the number of elements in the <b>rgTaggedAttribute</b> member array.
     */
    cTaggedAttribute : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_attribute">CMC_TAGGED_ATTRIBUTE</a> structures.
     */
    rgTaggedAttribute : CMC_TAGGED_ATTRIBUTE.Ptr

    /**
     * Count of the number of elements in the <b>rgTaggedContentInfo</b> member array.
     */
    cTaggedContentInfo : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_content_info">CMC_TAGGED_CONTENT_INFO</a> structures.
     */
    rgTaggedContentInfo : CMC_TAGGED_CONTENT_INFO.Ptr

    /**
     * Count of the number of elements in the <b>rgTaggedOtherMsg</b> member array.
     */
    cTaggedOtherMsg : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmc_tagged_other_msg">CMC_TAGGED_OTHER_MSG</a> structures.
     */
    rgTaggedOtherMsg : CMC_TAGGED_OTHER_MSG.Ptr

}
