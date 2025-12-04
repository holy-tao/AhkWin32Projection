#Requires AutoHotkey v2.0

#Include Windows\Win32\System\Com\Apis.ahk
#Include Win32Struct.ahk

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
class Guid extends Win32Struct {

    static sizeof => 16

    static packingSize => 8

    /**
     * Initializes as new `Guid` struct
     * 
     *      myGuid := Guid(0)                                           ; Creates an empty Guid
     *      myGuid := Guid(myPtr)                                       ; Wraps the Guid at myPtr
     *      myGuid := Guid("{6B29FC40-CA47-1067-B31D-00DD010662DA}")    ; Creates an initializes a new Guid
     * 
     * @param {Integer | String} ptrOrGuidString either a pointer to an existing Guid or a string
     *          representation of one in the format `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`. If an
     *          Integer, the Guid struct is initialized at the pointer and the contents of its memory
     *          are not modified. If a string, a new Buffer is allocated and populated based on the
     *          contents of the string
     */
    __New(ptrOrGuidString := 0){
        if(IsInteger(ptrOrGuidString)){
            super.__New(ptrOrGuidString)
            return
        }
        else{
            super.__New()
            if(!(ptrOrGuidString is String)){
                throw TypeError("Expected an Integer or String but got a(n) " . Type(ptrOrGuidString), , ptrOrGuidString)
            }

            Com.CLSIDFromString(ptrOrGuidString, this)
        }
    }

    /**
     * Creates and returns a new GUID, a unique 128-bit integer used for CLSIDs and interface identifiers.
     * @returns {Guid} the newly created Guid
     */
    static Create(){
        new := Guid(0)
        Com.CoCreateGuid(new)
        return new
    }

    /**
     * Checks whether two Guids are equal or not. Roughly equivalent to `MemoryEquals`, except
     * that this method invokes type checks `other` if it is not a raw pointer
     * @param {Guid} other Guid proxy or pointer to a guid structure in memory 
     */
    Equals(other){
        if(IsObject(other) && !(other is Guid)){
            throw TypeError("Expected a Guid but got a(n) " . other, , other)
        }
        
        return this.MemoryEquals(other)
    }

    /**
     * Creates a string representation of the Guid. This can be used to call
     * native AHK COM interop methods which expect strings like `ComObjQuery`
     * 
     *      String(myGuid) => "{6B29FC40-CA47-1067-B31D-00DD010662DA}" ; or something similar
     * 
     * @returns {String} a string representation of the Guid in the format `{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}`
     */
    ToString(){
        ;https://learn.microsoft.com/en-us/windows/win32/api/combaseapi/nf-combaseapi-stringfromguid2
        strBuf := Buffer(78)
        Com.StringFromGUID2(this, strBuf, 78)
        return StrGet(strBuf, "UTF-16")
    }
}