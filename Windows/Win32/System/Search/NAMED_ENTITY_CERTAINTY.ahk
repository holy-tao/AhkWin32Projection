#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the level of certainty for a named entity.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-named_entity_certainty
 * @namespace Windows.Win32.System.Search
 */
export default struct NAMED_ENTITY_CERTAINTY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * It could be this named entity but additional evidence is advisable.
     * @type {Integer (Int32)}
     */
    static NEC_LOW => 0

    /**
     * It quite likely is this named entity; it is okay to use it.
     * @type {Integer (Int32)}
     */
    static NEC_MEDIUM => 1

    /**
     * It almost certainly is this named entity; it should be okay to discard other possibilities.
     * @type {Integer (Int32)}
     */
    static NEC_HIGH => 2
}
