#Requires AutoHotkey v2.1-alpha.24+ 64-bit

#Import "Windows\Win32\System\Com\Apis.ahk" { CLSIDFromString, CoCreateGuid, StringFromGUID2 }

/**
 * Represents a GUID struct. A GUID is a **G**lobally **U**nique **ID**entifier for some resource. 
 * It's "just" a 128-bit number under the hood. This is a funamental type in Windows and doesn't 
 * appear in the Win32 metadata, so it needs to be hand-written.
 * 
 * When working with AutoHotkey COM interop, it's generally enough to use a string repesentation.
 * However, some of the Win32 APIs (e.g. `Foundation\PROPERTYKEY`) expect a binary representation
 * or pointer to one, which this class exists to provide.
 * 
 * If you are going to be working a lot with GUIDs, you may want to [load](https://www.autohotkey.com/docs/v2/lib/_DllLoad.htm)
 * `ole32.dll` explicitly for performance reasons
 * 
 * @see https://learn.microsoft.com/en-us/windows/win32/api/guiddef/ns-guiddef-guid
 */
struct Guid {
    #StructPack 8

    Data1: UInt32

    Data2: UInt16

    Data3: UInt16

    Data4: UInt8[8]

    /**
     * Initializes as new `Guid` struct
     * 
     *      myGuid := Guid("{6B29FC40-CA47-1067-B31D-00DD010662DA}")
     *      emptyGuid := Guid()
     * 
     * @param {String} ptrOrGuidString a string representation of a Guid in the format 
     *          `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}` from which to initialize the Guid
     */
    __New(guidStr?) {
        if IsSet(guidStr) {
            if !(guidStr is String) {
                throw TypeError("Expected a String but got a(n) " . Type(guidStr), , guidStr)
            }

            CLSIDFromString(guidStr, this)
        }
    }

    /**
     * Creates and returns a new GUID, a unique 128-bit integer used for CLSIDs and interface identifiers.
     * @returns {Guid} the newly created Guid
     */
    static Create() {
        CoCreateGuid(new := Guid())
        return new
    }

    /**
     * Compares the memory pointed at by this Guid to the memory pointed at by `other` and returns
     * true if they are equal and false otherwise
     * @param {Guid | Integer} other Guid or pointer to guid or buffer-like object to compare to 
     * @returns {Integer} 1 if this equals `other`, 0 otherwise
     */
    Equals(other) {
        matching := DllCall("kernel32\RtlCompareMemory", "ptr", this.ptr, "ptr", other, "int", this.size)
        return matching == this.Size
    }

    /**
     * Creates a string representation of the Guid. This can be used to call
     * native AHK COM interop methods which expect strings like `ComObjQuery`
     * 
     *      String(myGuid) => "{6B29FC40-CA47-1067-B31D-00DD010662DA}" ; or something similar
     * 
     * @returns {String} a string representation of the Guid in the format `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`
     */
    ToString() {
        ;https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-stringfromguid2
        StringFromGUID2(this, strBuf := Buffer(78), 78)
        return StrGet(strBuf, "UTF-16")
    }
}