#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to compare the attributes on two objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ne-mfobjects-mf_attributes_match_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_ATTRIBUTES_MATCH_TYPE{

    /**
     * Check whether all the attributes in <i>pThis</i> exist in <i>pTheirs</i> and have the same data, where <i>pThis</i> is the object whose <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-compare">Compare</a> method is being called and <i>pTheirs</i> is the object given in the <i>pTheirs</i> parameter.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTES_MATCH_OUR_ITEMS => 0

    /**
     * Check whether all the attributes in <i>pTheirs</i> exist in <i>pThis</i> and have the same data, where <i>pThis</i> is the object whose <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-compare">Compare</a> method is being called and <i>pTheirs</i> is the object given in the <i>pTheirs</i> parameter.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTES_MATCH_THEIR_ITEMS => 1

    /**
     * Check whether both objects have identical attributes with the same data.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTES_MATCH_ALL_ITEMS => 2

    /**
     * Check whether the attributes that exist in both objects have the same data.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTES_MATCH_INTERSECTION => 3

    /**
     * Find the object with the fewest number of attributes, and check if those attributes exist in the other object and have the same data.
     * @type {Integer (Int32)}
     */
    static MF_ATTRIBUTES_MATCH_SMALLER => 4
}
