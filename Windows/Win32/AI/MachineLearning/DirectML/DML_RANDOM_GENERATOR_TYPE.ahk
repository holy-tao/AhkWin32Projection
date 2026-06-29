#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify types of random random-number generator.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_random_generator_type
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_RANDOM_GENERATOR_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies a generator for pseudo-random numbers according to the [Philox 4x32-10 algorithm](http://www.thesalmons.org/john/random123/papers/random123sc11.pdf).
     * @type {Integer (Int32)}
     */
    static DML_RANDOM_GENERATOR_TYPE_PHILOX_4X32_10 => 0
}
