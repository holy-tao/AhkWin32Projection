#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the DICTIONARYPROPERTIES properties type enumerate properties associated with the attribute dictionary.
 * @remarks
 * The dictionary is the collection of all possible attributes. It includes some attributes that are reserved for system use.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-dictionaryproperties
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class DICTIONARYPROPERTIES{

    /**
     * The collection of all possible attributes.
     * @type {Integer (Int32)}
     */
    static PROPERTY_DICTIONARY_ATTRIBUTES_COLLECTION => 1024

    /**
     * The location of the datastore that contains the dictionary. This property is read-only.
     * @type {Integer (Int32)}
     */
    static PROPERTY_DICTIONARY_LOCATION => 1025
}
