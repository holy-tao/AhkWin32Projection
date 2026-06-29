#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DS_NAME_RESULT_ITEMW.ahk" { DS_NAME_RESULT_ITEMW }

/**
 * The DS_NAME_RESULT structure is used with the DsCrackNames function to contain the names converted by the function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The ntdsapi.h header defines DS_NAME_RESULT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ns-ntdsapi-ds_name_resultw
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @charset Unicode
 */
export default struct DS_NAME_RESULTW {
    #StructPack 8

    /**
     * Contains the number of elements in the <b>rItems</b> array.
     */
    cItems : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_result_itema">DS_NAME_RESULT_ITEM</a> structure pointers. Each element of this array represents a single converted name.
     */
    rItems : DS_NAME_RESULT_ITEMW.Ptr

}
