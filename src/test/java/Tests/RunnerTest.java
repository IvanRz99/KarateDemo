package Tests;

import com.intuit.karate.Runner;

public class RunnerTest {

		public static void main(String[] args) {
			Runner.path("src/test/java/Tests").tags("Test").parallel(1);
		}
}
