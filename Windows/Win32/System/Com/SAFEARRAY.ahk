#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFEARRAYBOUND.ahk" { SAFEARRAYBOUND }
#Import ".\ADVANCED_FEATURE_FLAGS.ahk" { ADVANCED_FEATURE_FLAGS }

/**
 * Represents a safe array.
 * @remarks
 * The array <b>rgsabound</b> is stored with the left-most dimension in rgsabound[0] and the right-most dimension in <c>rgsabound[cDims - 1]</c>. If an array was specified in a C-like syntax as a [2][5], it would have two elements in the <b>rgsabound</b> vector. Element 0 has an <b>lLbound</b> of 0 and a <b>cElements</b> of 2. Element 1 has an <b>lLbound</b> of 0 and a <b>cElements</b> of 5.
 * 
 * 
 * 
 * The <b>fFeatures</b> flags describe attributes of an array that can affect how the array is released. The <b>fFeatures</b> field describes what type of data is stored in the <b>SAFEARRAY</b> and how the array is allocated. This allows freeing the array without referencing its containing variant.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray
 * @namespace Windows.Win32.System.Com
 */
export default struct SAFEARRAY {
    #StructPack 8

    /**
     * The number of dimensions.
     */
    cDims : UInt16

    /**
     * Flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_AUTO"></a><a id="fadf_auto"></a><dl>
     * <dt><b>FADF_AUTO</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that is allocated on the stack.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_STATIC"></a><a id="fadf_static"></a><dl>
     * <dt><b>FADF_STATIC</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that is statically allocated.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_EMBEDDED"></a><a id="fadf_embedded"></a><dl>
     * <dt><b>FADF_EMBEDDED</b></dt>
     * <dt>0x0004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that is embedded in a structure.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_FIXEDSIZE"></a><a id="fadf_fixedsize"></a><dl>
     * <dt><b>FADF_FIXEDSIZE</b></dt>
     * <dt>0x0010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that may not be resized or reallocated.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_RECORD"></a><a id="fadf_record"></a><dl>
     * <dt><b>FADF_RECORD</b></dt>
     * <dt>0x0020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that contains records. When set, there will be a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-irecordinfo">IRecordInfo</a> interface at negative offset 4 in the array descriptor.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_HAVEIID"></a><a id="fadf_haveiid"></a><dl>
     * <dt><b>FADF_HAVEIID</b></dt>
     * <dt>0x0040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that has an IID identifying interface. When set, there will be a GUID at negative offset 16 in the safe array descriptor. Flag is set only when FADF_DISPATCH or FADF_UNKNOWN is also set. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_HAVEVARTYPE"></a><a id="fadf_havevartype"></a><dl>
     * <dt><b>FADF_HAVEVARTYPE</b></dt>
     * <dt>0x0080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array that has a variant type. The variant type can be retrieved with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/vartype">SafeArrayGetVartype</a>. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_BSTR"></a><a id="fadf_bstr"></a><dl>
     * <dt><b>FADF_BSTR</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of BSTRs.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_UNKNOWN"></a><a id="fadf_unknown"></a><dl>
     * <dt><b>FADF_UNKNOWN</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of IUnknown*.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_DISPATCH"></a><a id="fadf_dispatch"></a><dl>
     * <dt><b>FADF_DISPATCH</b></dt>
     * <dt>0x0400</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of IDispatch*.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_VARIANT"></a><a id="fadf_variant"></a><dl>
     * <dt><b>FADF_VARIANT</b></dt>
     * <dt>0x0800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An array of VARIANTs.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FADF_RESERVED"></a><a id="fadf_reserved"></a><dl>
     * <dt><b>FADF_RESERVED</b></dt>
     * <dt>0xF008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Bits reserved for future use.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    fFeatures : ADVANCED_FEATURE_FLAGS

    /**
     * The size of an array element.
     */
    cbElements : UInt32

    /**
     * The number of times the array has been locked without a corresponding unlock.
     */
    cLocks : UInt32

    /**
     * The data.
     */
    pvData : IntPtr

    /**
     * One bound for each dimension.
     */
    rgsabound : SAFEARRAYBOUND[1]

}
